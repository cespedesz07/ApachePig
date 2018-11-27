data2 = LOAD 'foreach_nested_example.txt' AS (keyword:chararray, was_clicked:int); DUMP data2;
# (tablet,0)
# (tablet,0)
# (tablet,0)
# (tablet,1)

grouped = GROUP data2 BY keyword; DUMP grouped;
# (tablet,{(tablet,1),(tablet,0),(tablet,0),(tablet,0)})
#
#
# La variable 'grouped' está compuesta por
# 	Key -> group: chararray
# 	Val -> data2: { (keyword: chararray, was_clicked: int) }
#
# > describe grouped;
# grouped: {group: chararray,data2: {(keyword: chararray,was_clicked: int)}}
#
# De esta manera:
# 	group: tablet
# 	data2: {(tablet,1),(tablet,0),(tablet,0),(tablet,0)}
by_keyword = FOREACH grouped 
{
  clicked = FILTER data2 BY was_clicked == 1;
  total = COUNT(data2.keyword);
  GENERATE group, ((double)COUNT(clicked) / total) AS ctr;
}
DUMP by_keyword;
# (tablet,0.25)
