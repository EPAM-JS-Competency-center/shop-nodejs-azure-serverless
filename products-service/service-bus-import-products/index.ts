import { AzureFunction } from "@azure/functions"
import {makeHandler} from "../src/common/inversify/make-handler";
import {ServiceBusImportProductsHandler} from "../src/modules/products/handlers/service-bus-import-products.handler";

const serviceBusTrigger: AzureFunction = makeHandler(ServiceBusImportProductsHandler)
export default serviceBusTrigger;
