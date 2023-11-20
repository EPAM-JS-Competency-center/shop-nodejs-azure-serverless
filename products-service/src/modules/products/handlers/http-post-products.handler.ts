import {injectable} from "inversify";
import {BaseHandler} from "../../../common/handlers/base.handler";
import {Context} from "@azure/functions";
import {Logger} from "../../../common/logger/logger";
import {ProductsService} from "../services/products.service";

@injectable()
export class HttpPostProductsHandler extends BaseHandler {
    constructor(
        private readonly logger: Logger,
        private readonly productsService: ProductsService
    ) {
        super();
    }

    async executeFunction(context: Context, ...args: any[]): Promise<void> {
        this.logger.info('HTTP trigger function processed a request.');
        context.res = {
            body: await this.productsService.createProduct(context.req.body)
        };
    }

}
