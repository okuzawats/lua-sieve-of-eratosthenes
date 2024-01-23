require "src/sieve"

local primeNumbers = sieve(1000)

-- 1000以下の素数は168個である。
assert(#primeNumbers == 168, "The number of prime numbers should be 168.")

for i = 1, #primeNumbers do
  print(primeNumbers[i])
end
