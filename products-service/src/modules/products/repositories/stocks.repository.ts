import {inject, injectable} from "inversify";
import {Container, Database} from "@azure/cosmos";
import {COSMOS_DB} from "../../../common/cosmos/cosmos-database";

@injectable()
export class StocksRepository {
    public readonly container: Container;

    constructor(@inject(COSMOS_DB) private readonly database: Database) {
        this.container = database.container('stocks')
    }

    async getStockForProduct(productId: string) {
        const item = await this.container.item(productId, productId).read();

        return item.resource;
    }
}
