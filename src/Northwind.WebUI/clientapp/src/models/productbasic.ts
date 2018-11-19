export default interface ProductBasic {
    productId : number;
    productName: string;
    quantityPerUnit: string;
    unitPrice?: number;
    unitsInStock?: number;
    unitsOnOrder?: number;
    reorderLevel?: number;
    discontinued?: boolean;
}