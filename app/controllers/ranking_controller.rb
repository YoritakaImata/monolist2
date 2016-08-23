class RankingController < ApplicationController
  def have
    @title = 'Have ランキング'
    @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    #=> {5=>12, 1=>11, 2=>10, 3=>9, 8=>9, 9=>7, 10=>6, 11=>5, 4=>4, 6=>3}
    item_ids = @ranking.keys
    #=> [5, 1, 2, 3, 8, 9, 10, 11, 4, 6]
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end

  def want
    @title = 'Want ランキング'
    @ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end
end
