import {injectable} from "inversify";
import {BaseHandler} from "../../../common/handlers/base.handler";
import {Context} from "@azure/functions";
import {Logger} from "../../../common/logger/logger";
import {generateBlobSASQueryParameters, BlobServiceClient, StorageSharedKeyCredential, BlobSASPermissions} from "@azure/storage-blob";

@injectable()
export class HttpGetImportProductsFiles extends BaseHandler {
    constructor(
        private readonly logger: Logger,
    ) {
        super();
    }

    async executeFunction(context: Context, ...args: any[]): Promise<void> {
        const containerName = 'uploaded';
        const blobName = context.req.query.name as string;
        const connectionString = process.env.CONNECTION_IMPORT_FILES_STORAGE_ACCOUNT;

        const blobServiceClient = BlobServiceClient.fromConnectionString(connectionString);
        const containerClient = blobServiceClient.getContainerClient(containerName);
        const blobClient = containerClient.getBlobClient(blobName);

        const permissions = BlobSASPermissions.parse("rw"); // read and write permissions
        const expiryDate = new Date();
        expiryDate.setMinutes(expiryDate.getMinutes() + 15); // 15 minutes from now

        const sasToken = generateBlobSASQueryParameters(
            {
                containerName,
                blobName,
                permissions,
                startsOn: new Date(),
                expiresOn: expiryDate,
            },
            // @ts-ignore
            new StorageSharedKeyCredential(containerClient.accountName, (containerClient.credential as StorageSharedKeyCredential)!.accountKey)
        ).toString();

        const sasUrl = blobClient.url + "?" + sasToken;

        context.res = {
            status: 200,
            body: sasUrl
        };
    }

}
