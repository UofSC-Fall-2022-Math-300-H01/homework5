import Hw4
import Lean.Elab.Print
import Lean.Elab.Command

open Lean
open Lean.Elab.Command

def collectAxiomsOf (constName : Name) : MetaM (List String) := do
  let env ← getEnv
  let (_, s) := ((CollectAxioms.collect constName).run env).run {}
  let a := s.axioms.toList.map toString
  return a

#eval collectAxiomsOf ``problem1
