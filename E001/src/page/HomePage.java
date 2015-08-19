package page;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class HomePage {

	private WebDriver driver;
	private By searchLocator = By.id("suggestion-search");
	
	public HomePage(WebDriver driver) {
		this.driver = driver;
	}
	
	public SearchResultPage doSearch(String searchValue) {
		WebElement searchField = driver.findElement(searchLocator);
		searchField.sendKeys(searchValue);
		searchField.submit();
		
		return new SearchResultPage(driver);
	}
}
