class AuctionUpdater
  @queue = :auction_updater
  
  # Updates each auction's info for every online user. If the auction has ended, update the status.
  def self.perform
    #$online_users.each do |user|
    User.all.each do |user|
      user.auctions.each do |auction|
        if auction.auction_status.to_s == "Active"
          #auction.item.merge! EbayAction.new.get_item(auction.item_id, "timeleft,bidcount,currentprice,userid")
          auction.item = EbayAction.new.get_item(auction.item_id, "")
          if auction.item[:get_item_response][:item][:time_left] == "PT0S"
            find_status(auction)
          end
          auction.save
        end
      end
    end
  end
  
  def self.find_status(auction)
    # If the auction is over, check if we won or lost
    if auction.item[:get_item_response][:item][:time_left] == "PT0S"
      # Change current_user.name to wherever the user's ebay username is stored
      if auction.item[:get_item_response][:item][:selling_status][:high_bidder][:user_id] == "testuser_jpwendt2"
        auction.auction_status = "Won"
      else
        auction.auction_status = "Lost"
      end
    else
      auction.auction_status = "Active"
    end
  end
end