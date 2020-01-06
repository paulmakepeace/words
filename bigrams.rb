#!/usr/bin/env ruby

# Emit a typing exercise consisting of lots of bigrams

# Data from http://norvig.com/mayzner.html
bigrams_data = %[
TH  100.3 B (3.56%)  TH
HE   86.7 B (3.07%)  HE
IN   68.6 B (2.43%)  IN
ER   57.8 B (2.05%)  ER
AN   56.0 B (1.99%)  AN
RE   52.3 B (1.85%)  RE
ON   49.6 B (1.76%)  ON
AT   41.9 B (1.49%)  AT
EN   41.0 B (1.45%)  EN
ND   38.1 B (1.35%)  ND
TI   37.9 B (1.34%)  TI
ES   37.8 B (1.34%)  ES
OR   36.0 B (1.28%)  OR
TE   34.0 B (1.20%)  TE
OF   33.1 B (1.17%)  OF
ED   32.9 B (1.17%)  ED
IS   31.8 B (1.13%)  IS
IT   31.7 B (1.12%)  IT
AL   30.7 B (1.09%)  AL
AR   30.3 B (1.07%)  AR
ST   29.7 B (1.05%)  ST
TO   29.4 B (1.04%)  TO
NT   29.4 B (1.04%)  NT
NG   26.9 B (0.95%)  NG
SE   26.3 B (0.93%)  SE
HA   26.1 B (0.93%)  HA
AS   24.6 B (0.87%)  AS
OU   24.5 B (0.87%)  OU
IO   23.5 B (0.83%)  IO
LE   23.4 B (0.83%)  LE
VE   23.3 B (0.83%)  VE
CO   22.4 B (0.79%)  CO
ME   22.4 B (0.79%)  ME
DE   21.6 B (0.76%)  DE
HI   21.5 B (0.76%)  HI
RI   20.5 B (0.73%)  RI
RO   20.5 B (0.73%)  RO
IC   19.7 B (0.70%)  IC
NE   19.5 B (0.69%)  NE
EA   19.4 B (0.69%)  EA
RA   19.3 B (0.69%)  RA
CE   18.4 B (0.65%)  CE
LI   17.6 B (0.62%)  LI
CH   16.9 B (0.60%)  CH
LL   16.3 B (0.58%)  LL
BE   16.2 B (0.58%)  BE
MA   15.9 B (0.57%)  MA
SI   15.5 B (0.55%)  SI
OM   15.4 B (0.55%)  OM
UR   15.3 B (0.54%)  UR
]


# map of a random number in the range [0,count) to bigram by frequency
# (not actually using this yet)
possibilities = []
count = 0

# Array of lowercase bigrams in descending frequency order
bigrams = []

bigrams_data.split("\n").each do |line|
  /^(?<bigram>..).*\((?<freq>\d+\.\d+)/ =~ line or next
  bigram.downcase!
  bigrams << bigram
  (0.5 + freq.to_f * 10).to_i.times do
    possibilities[count] = bigram
    count += 1
  end
end

exercise = ""
subset = bigrams[0..5]
while(exercise.size < 2000) do
  exercise += subset.sample + " "
end

puts exercise

