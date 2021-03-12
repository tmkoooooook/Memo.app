require "csv"

for value in 0...100 do
    puts "1(新規でメモを作成) 2(既存のメモを編集する) 3(やっぱやめる)"
    memo_type = gets.to_s.chomp!
    
    if memo_type == "1"
        puts "拡張子を除いたファイル名を入力してください"
        memoName = gets.to_s.chomp!
        memoName += ".csv"
        CSV.open(memoName, "w") do |csv|
            puts "編集してください\n編集を終えるには『ctrl D』を同時押ししてください"
            memoPad = readlines
            memoPad.each do |memo|
                memo.chomp!
            end
            csv << memoPad
        end
        break
    elsif memo_type == "2"
        puts "編集したいメモファイル名を入力してください"
        memoName = gets.to_s.chomp!
        memoName += ".csv"
        CSV.open(memoName, "a") do |csv|
            puts "編集してください\n編集を終えるには『ctrl D』を同時押ししてください"
            memoPad = readlines
            memoPad.each do |memo|
                memo.chomp!
            end
            csv << memoPad
        end
        break
    elsif memo_type == "3"
        break
    else
        puts "『1』,『2』,『3』のいずれかを入力してください"
        redo
    end
end
