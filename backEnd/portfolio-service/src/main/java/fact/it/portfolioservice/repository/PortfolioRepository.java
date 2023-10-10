package fact.it.portfolioservice.repository;

import fact.it.portfolioservice.model.Post;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Transactional
public interface PortfolioRepository extends JpaRepository<Post, Long> {

}
