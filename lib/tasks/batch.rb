require "#{Rails.root}/app/models/fav"
require "date"

class Tasks::Batch
  def self.execute
    today = Date.today
    hoge= today -7
    hoge = hoge.strftime('%Y-%m-%d')
    today = today.strftime('%Y-%m-%d')

    sql="select cd_id from favs where created_at between '#{hoge}' and  '#{today}' group by cd_id order by count(*) desc limit 3;"

    all_ranks = Fav.find_by_sql(sql)

    Ranking.delete_all
    all_ranks.each do |rank|
      Ranking.create!(cd_id: rank.cd_id)
      puts "done"
    end
  end
end
