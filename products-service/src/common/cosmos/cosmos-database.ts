import {appContainer} from "../inversify/container";
import {CosmosClient} from "@azure/cosmos";

export const COSMOS_DB = 'COSMOS_DB';

appContainer
    .bind(COSMOS_DB)
    .toDynamicValue(async () => {
        const client = new CosmosClient(process.env.COSMOS_DB_CONNECTION_STRING);

        return client.database('products-db')
    });
