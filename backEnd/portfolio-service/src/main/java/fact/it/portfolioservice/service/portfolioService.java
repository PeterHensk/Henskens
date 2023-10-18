package fact.it.portfolioservice.service;

import fact.it.portfolioservice.model.Comment;
import fact.it.portfolioservice.model.Post;
import fact.it.portfolioservice.repository.PortfolioRepository;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class portfolioService {

    private final PortfolioRepository portfolioRepository;

    @PostConstruct
    public void loadData() {
        if(portfolioRepository.count() <= 0){
            Post post = new Post();
            post.setPostCode("dfgdsfgdsgmlkj");
            post.setPostTitle("Seomething new in my life");
            post.setPostValue("Op en dag was er iets gebeurd en dit wil ik nu even delen met de wereld, niet dat het iemand boeit...");

            Comment comment = new Comment();
            comment.setCommendCode("kjlmkljQSDFGkjlh");
            comment.setComment("comment voorbeeld nummer 1");
            comment.setUserEmailAddress("peter.henskens@gmail.com");
            comment.setPost(post);
            post.getComments().add(comment);

            portfolioRepository.save(post);
        }
    }

//    public List<Post> getAllPostsWithComments() {
//        return PortfolioRepository.findAllWithComments();
//    }
}
