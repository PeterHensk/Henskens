package fact.it.portfolioservice.controller;

import fact.it.portfolioservice.dto.PostResponse;
import fact.it.portfolioservice.model.Post;
import fact.it.portfolioservice.service.portfolioService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/portfolio")
@RequiredArgsConstructor
class PortfolioController {

    private final portfolioService portfolioService;

//    @GetMapping("/posts")
//    public ResponseEntity<List<Post>> getAllPostsWithComments() {
//        List<Post> posts = portfolioService.getAllPostsWithComments();
//        return ResponseEntity.ok(posts);
//    }
}