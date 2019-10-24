#ライブラリの読み込み
require "strscan"

#メソッドの定義
def formula_smp(formula)
    formula_array = Array.new
    s = StringScanner.new(formula)
    cnt = 0
    while !s.eos?
        case
        when s.scan(/(\+|\-|\*|\/)/)
            formula_array.unshift(s[0])
            cnt += 1
        when s.scan(/(\d+\.\d+|\d+)/)
            formula_array.push(s[0])
        when s.scan(/(\w+|\s+)/)
            puts "数字と演算記号のみの式を入力してください"
            exit
        end
    end

    if cnt != 1
      puts "正しく式を入力してください。"
      exit
    end

    case
    when formula_array[0] == "+"
        ans = formula_array[1].to_f + formula_array[2].to_f
    when formula_array[0] == "-"
        ans = formula_array[1].to_f - formula_array[2].to_f
    when formula_array[0] == "*"
        ans = formula_array[1].to_f * formula_array[2].to_f
    when formula_array[0] == "/"
        if formula_array[2] == "0"
          puts "--- ERROR ---"
          exit
        end
        ans = formula_array[1].to_f / formula_array[2].to_f
    end

    print formula_array[1] + formula_array[0] + formula_array[2] + "="

    if ans.to_i == ans.to_f
        ans = ans.to_i
    end

    return ans

end

#
puts "計算したい二項の式を入力してください。=はいりません。"
que = gets.chomp
puts formula_smp(que)
