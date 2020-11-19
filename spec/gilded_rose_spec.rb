require './gilded_rose'
require './item'

describe 'GildedRose' do

    it "It should decrease sellin and quality" do
        itemName = "some item"
        sellIn = 2; 
        quality = 2;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality-1)
    end

    it "It should decrease sellin and quality by double when sellin = 0" do
        itemName = "some other item"
        sellIn = 0; 
        quality = 2;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality-2)
    end

    it "Quality should never be negative" do
        itemName = "some item"
        sellIn = 0; 
        quality = 0;
        testSingleItem(itemName, sellIn, quality, sellIn-1, 0)
    end

    it "Brie cheese should increases quality by 1" do
        itemName = 'Aged Brie'
        sellIn = 10; 
        quality = 3;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality+1)
    end

    it "Brie cheese should increases quality by 2" do
        itemName = 'Aged Brie'
        sellIn = 0; 
        quality = 3;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality+2)
    end

    it "Quality is never bigger than 50" do
        itemName = 'Aged Brie'
        sellIn = 0; 
        quality = 50;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality)
    end

    it "Sulfuras never decreases sellin nor quality" do
        itemName = 'Sulfuras, Hand of Ragnaros'
        sellIn = 2; 
        quality = 2;
        testSingleItem(itemName, sellIn, quality, sellIn, quality)
    end

    it "Backstage increases quality by 2 when sellin <=10" do
        itemName = 'Backstage passes to a TAFKAL80ETC concert'
        sellIn = 10; 
        quality = 10;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality+2)
    end

    it "Backstage increases quality by 3 when sellin <=5" do
        itemName = 'Backstage passes to a TAFKAL80ETC concert'
        sellIn = 5; 
        quality = 10;
        testSingleItem(itemName, sellIn, quality, sellIn-1, quality+3)
    end

    it "Backstage decreases quality to 0 when sellin <= 0" do
        itemName = 'Backstage passes to a TAFKAL80ETC concert'
        sellIn = 0; 
        quality = 10;
        testSingleItem(itemName, sellIn, quality, sellIn-1, 0)
    end
    
end


def testSingleItem(itemName, sellIn, quality, expectedSellin, expectedQuality)
    app = GildedRose.new
    items = []
    items.push Item.new itemName, sellIn, quality

    app.update_quality items
    expect(items[0].name).to eq itemName
    expect(items[0].sell_in).to eq expectedSellin
    expect(items[0].quality).to eq expectedQuality
end


