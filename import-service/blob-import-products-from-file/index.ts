import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {BlobImportProductsFromFileHandler} from "../src/modules/products/handlers/blob-import-products-from-file";

const blobTrigger: AzureFunction = makeHandler(BlobImportProductsFromFileHandler)
export default blobTrigger;
