require "rails_helper"
require_relative '../../lib/tasks/batch'

describe "ランキング表示" do

  before do
    create_list(:fav, 1)
    today = Date.today
    hoge = today -7
    hoge = hoge.strftime('%Y-%m-%d')
    today = today.strftime('%Y-%m-%d')
    @sql="select cd_id from favs where created_at between '#{hoge}' and  '#{today}' group by cd_id order by count(*) desc limit 3;"
  end
  it "１週間で人気だった３作品を取り出せるか" do
    expect(Fav.find_by_sql(@sql)).to be be_falsey
  end
end
