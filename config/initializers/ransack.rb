Ransack.configure do |config|
config.add_predicate 'lteq_end_of_day',
:arel_predicate => 'lteq',
:formatter => proc {|v| v.end_of_day},
:compounds => false
#範囲検索で時間を含めて検索するため、1日を指定範囲にしている
end
