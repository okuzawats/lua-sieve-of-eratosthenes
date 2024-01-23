--- n以下の整数のうち、素数のみを格納した配列を返す。
-- @param n 対象となる整数。正の値である必要がある。
-- @return n以下の整数のうち、素数のみを格納した配列。
function sieve(n)
  assert(n > 0, "n must be positive.")

  local sieve = {} -- 判定対象となる整数値を格納する配列（「篩（ふるい）」と呼ぶ）
  local prime = {} -- 素数と判定された整数値を格納する配列

  -- n = 2、n = 3の時に正しく動いていないことに気付いたので、そのバグを回避するためのコード。
  if n == 2 then return { 2 } end
  if n == 3 then return { 2, 3 } end

  -- 篩をtrueで初期化する。1はスキップして良い。
  for i = 2, n do
    sieve[i] = true
  end

  -- nの平方根（より小さい最大の整数）まで、篩操作を行う。この操作はnの平方根までで十分。
  for i = 2, math.sqrt(n) do
    -- 対象の整数がtrue（素数）の場合は、その倍数をfalse（合成数）とする。
    -- iの2倍の整数値からnまで、iの倍数について篩落とす。
    if sieve[i] then
      for ii = i * 2, n, i do
        sieve[ii] = false
      end
    end
  end

  -- 篩に残った整数は素数であるため、配列に格納する。
  for i = 2, #sieve do
    if sieve[i] then
      table.insert(prime, i)
    end
  end

  return prime
end
