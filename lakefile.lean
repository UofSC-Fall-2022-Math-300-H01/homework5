import Lake
open Lake DSL

package hw4

@[defaultTarget]
lean_lib Hw4

lean_exe Tests.Problem1

-- script grade (args) do 
--  if h : 0 < args.length then 
--    IO.println s!"{args}"
--   else 
--    IO.println s!"💩" 
--   return 0 
