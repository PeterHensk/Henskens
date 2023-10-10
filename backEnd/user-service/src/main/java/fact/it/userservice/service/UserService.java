package fact.it.userservice.service;

import fact.it.userservice.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
@RequiredArgsConstructor
@Transactional
public class UserService {

    private final UserRepository userRepository;
    private final WebClient webClient;

//    @Value("${productservice.baseurl}")
//    private String productServiceBaseUrl;
//
//    @Value("${inventoryservice.baseurl}")
//    private String inventoryServiceBaseUrl;


}
