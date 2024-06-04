// Disables default interface elements
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_QUICK_STATS, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_MENU_BUTTONS, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_FLYOUT_SCOREBOARD, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_TOP_HEROES, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_SHOP_COMMONITEMS, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_INVENTORY_COURIER, false);
GameUI.SetDefaultUIEnabled(DotaDefaultUIElement_t.DOTA_DEFAULT_UI_AGHANIMS_STATUS, false);

// Declares the interface variables
var hud = $.GetContextPanel().GetParent().GetParent().GetParent();
var shopUI = hud.FindChildTraverse("HUDElements").FindChildTraverse("shop").FindChildTraverse("Main").FindChildTraverse("HeightLimiter").FindChildTraverse("GridMainShop");
var goldUI = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("shop_launcher_block");
var heroUI = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("center_with_stats").FindChildTraverse("center_block");

// Moves the gold interface to the backpack
goldUI.SetParent(heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list"));
var shopLauncher = heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list").FindChildTraverse("shop_launcher_block");
shopLauncher.FindChildTraverse("shop_launcher_bg").style.visibility = "collapse";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").style.horizontalAlign = "center";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").style.transform = "scaleX(-1)";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").style.width = "202px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").style.height = "41px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").style.marginLeft = "0px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").style.marginBottom = "0px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("GoldLabel").style.marginRight = "91px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("GoldIcon").style.width = "30px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("GoldIcon").style.height = "30px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("GoldIcon").style.marginRight = "55px";
shopLauncher.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("GoldIcon").style.marginBottom = "0px";

// Disables elements in the shop
shopUI.FindChildTraverse("GridShopHeaders").FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("RequestSuggestion").style.visibility = "collapse";
shopUI.FindChildTraverse("GridShopHeaders").FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("PopularItems").style.visibility = "collapse";
shopUI.FindChildTraverse("GridShopHeaders").FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleMinimalShop").style.visibility = "collapse";
shopUI.FindChildTraverse("GridShopHeaders").FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleAdvancedShop").style.visibility = "collapse";
shopUI.FindChildTraverse("GridShopHeaders").FindChildTraverse("GridMainTabs").style.visibility = "collapse";

// Disables the quick buy interface
goldUI.FindChildTraverse("quickbuy").FindChildTraverse("QuickBuyRows").style.visibility = "collapse";

// Disables the buyback / death costs when hovering the shop button
goldUI.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").SetPanelEvent("onmouseover", function () { });

// Disables the buyback label in the shop button
goldUI.FindChildTraverse("quickbuy").FindChildTraverse("ShopCourierControls").FindChildTraverse("ShopButton").FindChildTraverse("BuybackHeader").style.visibility = "collapse";

// Disables the stash
hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("shop_launcher_block").FindChildTraverse("stash").style.visibility = "collapse";

// Disables the talent tree
heroUI.FindChildTraverse("StatBranch").style.visibility = "collapse";
heroUI.FindChildTraverse("StatBranchHotkey").style.visibility = "collapse";
heroUI.FindChildTraverse("level_stats_frame").style.visibility = "collapse";
heroUI.FindChildTraverse("StatBranch").SetPanelEvent("onmouseover", function () { });
heroUI.FindChildTraverse("StatBranch").SetPanelEvent("onactivate", function () { });
hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("StatBranchDrawer").style.visibility = "collapse";

// Disables the backpack
heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list").style.marginLeft = "0px";
heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list").FindChildTraverse("inventory_slot_6").style.visibility = "collapse";
heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list").FindChildTraverse("inventory_slot_7").style.visibility = "collapse";
heroUI.FindChildTraverse("inventory").FindChildTraverse("inventory_items").FindChildTraverse("inventory_backpack_list").FindChildTraverse("inventory_slot_8").style.visibility = "collapse";

// Disables the neutral item and Teleport Scroll slots
heroUI.FindChildTraverse("inventory_composition_layer_container").style.visibility = "collapse";

// Decreases the size of the right side border of the hero interface
heroUI.FindChildTraverse("right_flare").style.width = "32px";
heroUI.FindChildTraverse("right_flare").style.marginRight = "61px";

// Disables the glyph and scan block
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("GlyphScanContainer").style.visibility = "collapse";