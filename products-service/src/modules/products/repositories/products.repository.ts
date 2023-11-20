import {inject, injectable} from "inversify";
import {COSMOS_DB} from "../../../common/cosmos/cosmos-database";
import {Database, Container} from "@azure/cosmos";
import {Product} from "../types";


@injectable()
export class ProductsRepository {
    public readonly container: Container;

    constructor(@inject(COSMOS_DB) private readonly database: Database) {
        this.container = database.container('products')
    }

    async getProducts() {
       const response = await this.container.items.query(`SELECT * FROM c`).fetchAll();

       return response.resources;
    }

    async getProductById(id: string) {
        const response = await this.container.item(id, id).read();

        return response.resource;
    }

    async upsertProduct(product: Product) {
        await this.container.items.upsert(product);
    }
}
