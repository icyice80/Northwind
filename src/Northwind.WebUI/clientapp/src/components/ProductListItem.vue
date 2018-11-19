<template>
  <div class="product-list-item">
    <span>{{ product.productId }}</span>
    <span>{{ product.productName }}</span>
    <span>{{ product.quantityPerUnit }}</span>
    <span>{{ product.unitPrice }}</span>
    <span>{{ product.discontinued }}</span>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator';
import ProductBasic from '../models/productbasic';
 
@Component
export default class ProductListItem extends Vue {
  @Prop() product!: ProductBasic;

  // mounted(){
  //   console.log(this.product);
  // }
}
</script>
