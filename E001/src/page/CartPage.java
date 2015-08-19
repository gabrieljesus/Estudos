package page;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class CartPage {

	private WebDriver driver;
	private By firstItemTextLocator = By.xpath("//div[@id='main']/div/section/div/article/ul/li/ul/li[1]/div/div[1]/a");
	
	public CartPage(WebDriver driver) {
		this.driver = driver;
	}
	
	public String getFirstItemText() {
		WebElement firstItemText = driver.findElement(firstItemTextLocator);
		
		return firstItemText.getText();
	}
}
