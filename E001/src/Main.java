import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import page.CartPage;
import page.HomePage;
import page.ProductPage;
import page.SearchResultPage;

public class Main {
	 /*
	  * Validacoes feitas sem o uso do junit para que todas as etapas do teste sejam executadas
	  */
	public static void main(String[] args) {
		
		WebDriver driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		driver.get("http://www.walmart.com.br");
		
		HomePage homePage = new HomePage(driver);
		SearchResultPage searchResultPage = homePage.doSearch("tv");
		
		// Verifica que o resultado eh > 0
		if(searchResultPage.getResultCount() > 0)
			System.out.println("INFO: " + searchResultPage.getResultCount() + " resultados encontrados");
		else
			System.out.println("ERRO: >>> Algum erro ocorreu na busca de produtos");

		ProductPage productPage = searchResultPage.clickFirstResultItem();
		String productName = productPage.getProductName();
		System.out.println("INFO: Nome do produto: " + productName);
		
		productPage.addToCart();
		
		CartPage cartPage = productPage.goToCart();
		
		// Verifica se o produto esta no carrinho
		if(productName.equals(cartPage.getFirstItemText()))
			System.out.println("INFO: Item encontrado no carrinho");
		else
			System.out.println("ERRO: >>> Item nao encontrado no carrinho");
		
		driver.quit();
	}

}
