import {injectable} from "inversify";
import {Product} from "../types";
import {ProductsRepository} from "../repositories/products.repository";
import {StocksRepository} from "../repositories/stocks.repository";

@injectable()
export class ProductsService {

    constructor(
        private readonly productsRepository: ProductsRepository,
        private readonly stocksRepository: StocksRepository,
    ) {
    }

    async getProducts(): Promise<Product[]> {
        const products = await this.productsRepository.getProducts();

        return Promise.all(products.map(async (product) => {
            const stock = await this.stocksRepository.getStockForProduct(product.id);

            return {
                ...product,
                count: stock?.count || 0
            }
        }));
    }

    async getProductById(id: string): Promise<Product> {
        return await this.productsRepository.getProductById(id);
    }

    async createProduct(product: Product): Promise<void> {
        await this.productsRepository.upsertProduct(product);
    }
}
