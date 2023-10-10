package fact.it.portfolioservice.controller;

import fact.it.portfolioservice.dto.PostResponse;
import fact.it.portfolioservice.service.portfolioService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/portfolio")
@RequiredArgsConstructor
public class portfolioController {

    private final portfolioService portfolioService;

}