package page;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ProductPage {

	private WebDriver driver;
	private By buyButtonLocator = By.xpath("//section[@id='buybox-Walmart']/div[2]/div/div[@class='buy-button-wrapper']/button");
	private By proceedButtonLocator = By.id("navegaCarrinho");
	private By cartLocator = By.xpath("//header[@id='site-topbar']/div[2]/div[@class='cart']/a");
	private By productNameLocator = By.xpath("//*[@id='main']/article/div[1]/h1");
	
	public ProductPage(WebDriver driver) {
		this.driver = driver;
	}
	
	public void addToCart() {
		WebElement buyButton = driver.findElement(buyButtonLocator);
		buyButton.click();
		
		WebElement proceedButton = driver.findElement(proceedButtonLocator);
		proceedButton.click();
	}
	
	public String getProductName() {
		WebElement productName = driver.findElement(productNameLocator);
		
		return productName.getText();
	}
	
	public CartPage goToCart() {
		WebElement cartLink = driver.findElement(cartLocator);
		cartLink.click();
		
		return new CartPage(driver);
	}
}
