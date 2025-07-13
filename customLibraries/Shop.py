from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def select_item_to_add_to_cart(self, item_list):
        product_list = self.selLib.get_webelements("css:.card-title")
        for product in product_list:
            if product.text in item_list:
                self.selLib.click_element(product)
                self.selLib.page_should_contain("Add to cart")
                break


