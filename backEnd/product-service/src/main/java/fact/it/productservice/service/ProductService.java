package fact.it.productservice.service;

import fact.it.productservice.dto.ProductRequest;
import fact.it.productservice.dto.ProductResponse;
import fact.it.productservice.model.Product;
import fact.it.productservice.repository.ProductRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    @PostConstruct
    public void loadData() {
        if(productRepository.count() <= 0){
            Product product = Product.builder()
                    .skuCode("tube6in")
                    .userId("peter.Henskens@gmail.com")
                    .name("Roos")
                    .information("healty rose, but to much shade")
                    .description("Its a red rose with white dots")
                    .build();

            Product product1 = Product.builder()
                    .skuCode("tube6in")
                    .userId("lisawouters@hotmail.com")
                    .name("Daisy")
                    .information("Its to dry, give it some watter")
                    .description("ne flauwe plant, niets speciaals")
                    .build();

            productRepository.save(product);
            productRepository.save(product1);
        }
    }

    public void createProduct(ProductRequest productRequest){
        Product product = Product.builder()
                .skuCode(productRequest.getSkuCode())
                .userId(productRequest.getUserId())
                .name(productRequest.getName())
                .description(productRequest.getDescription())
                .information(productRequest.getInformation())
                .build();

        productRepository.save(product);
    }

    public List<ProductResponse> getAllProducts() {
        List<Product> products = productRepository.findAll();

        return products.stream().map(this::mapToProductResponse).toList();
    }

    public List<ProductResponse> getAllProductsBySkuCode(List<String> skuCode) {
        List<Product> products = productRepository.findBySkuCodeIn(skuCode);

        return products.stream().map(this::mapToProductResponse).toList();
    }

    private ProductResponse mapToProductResponse(Product product) {
        return ProductResponse.builder()
                .id(product.getId())
                .userId(product.getUserId())
                .skuCode(product.getSkuCode())
                .name(product.getName())
                .description(product.getDescription())
                .information(product.getInformation())
                .build();
    }

}
