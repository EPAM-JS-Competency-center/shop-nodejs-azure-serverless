import {injectable} from "inversify";
import {BaseHandler} from "../../../common/handlers/base.handler";
import {Context} from "@azure/functions";
import {Logger} from "../../../common/logger/logger";
import { parse } from "csv-parse/sync";
import {ServiceBusClient, ServiceBusMessage} from "@azure/service-bus";

@injectable()
export class BlobImportProductsFromFileHandler extends BaseHandler {
    constructor(
        private readonly logger: Logger,
    ) {
        super();
    }

    async executeFunction(context: Context, ...args: any[]): Promise<void> {
        const records = parse(context.bindings.blob, {
            columns: true,
            skip_empty_lines: true,
        });

        const serviceBusClient = new ServiceBusClient(process.env.CONNECTION_SERVICE_BUS);

        const messages = records.map((record): ServiceBusMessage => ({
            body: record
        }));

        await serviceBusClient.createSender("products-import").sendMessages(messages);
    }
}
