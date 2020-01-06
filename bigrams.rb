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

words_data = %[
the     53.10 B  7.14%  the
of      30.97 B  4.16%  of
and     22.63 B  3.04%  and
to      19.35 B  2.60%  to
in      16.89 B  2.27%  in
a       15.31 B  2.06%  a
is       8.38 B  1.13%  is
that     8.00 B  1.08%  that
for      6.55 B  0.88%  for
it       5.74 B  0.77%  it
as       5.70 B  0.77%  as
was      5.50 B  0.74%  was
with     5.18 B  0.70%  with
be       4.82 B  0.65%  be
by       4.70 B  0.63%  by
on       4.59 B  0.62%  on
not      4.52 B  0.61%  not
he       4.11 B  0.55%  he
i        3.88 B  0.52%  i
this     3.83 B  0.51%  this
are      3.70 B  0.50%  are
or       3.67 B  0.49%  or
his      3.61 B  0.49%  his
from     3.47 B  0.47%  from
at       3.41 B  0.46%  at
which    3.14 B  0.42%  which
but      2.79 B  0.38%  but
have     2.78 B  0.37%  have
an       2.73 B  0.37%  an
had      2.62 B  0.35%  had
they     2.46 B  0.33%  they
you      2.34 B  0.31%  you
were     2.27 B  0.31%  were
their    2.15 B  0.29%  their
one      2.15 B  0.29%  one
all      2.06 B  0.28%  all
we       2.06 B  0.28%  we
can      1.67 B  0.22%  can
her      1.63 B  0.22%  her
has      1.63 B  0.22%  has
there    1.62 B  0.22%  there
been     1.62 B  0.22%  been
if       1.56 B  0.21%  if
more     1.55 B  0.21%  more
when     1.52 B  0.20%  when
will     1.49 B  0.20%  will
would    1.47 B  0.20%  would
who      1.46 B  0.20%  who
so       1.45 B  0.19%  so
no       1.40 B  0.19%  no
]


def frequencies(data)
  # map of a random number in the range [0,count) to token by frequency
  # (not actually using this yet)
  possibilities = []
  count = 0
  # Array of lowercase tokens in descending frequency order
  tokens = []

  data.split("\n").each do |line|
    /^(?<token>\w+).*(?<freq>\d+\.\d+)%/ =~ line or next
    token.downcase!
    tokens << token
    (0.5 + freq.to_f * 10).to_i.times do
      possibilities[count] = token
      count += 1
    end
  end

  tokens #, possibilities
end

def create_exercise(words, word_count=200)
  begin
    [
      words.flat_map { |word| [word] * 5 }, # warm up
      (1..word_count).map { words.sample }
    ]
  end.flatten.join(" ")
end

#words = frequencies(bigrams_data)
lesson_length = 5
lesson_number = 2
words = frequencies(words_data)
lesson = words[(lesson_number-1) * lesson_length .. (lesson_number * lesson_length)-1]
puts "Lesson: ##{lesson_number}"
puts "Words: #{lesson.join(", ")}"
puts "Paste:"
puts create_exercise(lesson), "4321"




