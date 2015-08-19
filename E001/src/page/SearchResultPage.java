package page;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class SearchResultPage {

	private WebDriver driver;
	private By resultCountLocator = By.className("result-items");
	private By firstProductLocator = By.xpath("//div[@id='category-products']/div[1]//li[contains(@class, 'item-0')]/figure/a");
	
	public SearchResultPage(WebDriver driver) {
		this.driver = driver;
	}
	
	public int getResultCount() {
		WebElement resultCountField = driver.findElement(resultCountLocator);
		String dirtyResultCountValue = resultCountField.getText();
		String[] resultCountValues = dirtyResultCountValue.split(" ");
		int resultCount = Integer.parseInt(resultCountValues[0]);
		
		return resultCount;
	}
	
	public ProductPage clickFirstResultItem() {
		WebElement firstProduct = driver.findElement(firstProductLocator);
		firstProduct.click();
		
		return new ProductPage(driver);
	}
}
