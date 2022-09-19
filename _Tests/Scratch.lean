import Hw4
import Lean.CoreM
import Lean.Elab.Print
import Lean.Util.FoldConsts
import Lean.Elab.Command

open Lean
open Lean.Meta
open Lean.Elab
open Lean.Elab.Command


def collectAxiomsOf (constName : Name) : MetaM (List Name) := do
  let env ← getEnv
  let (_, s) := ((CollectAxioms.collect constName).run env).run {}
  return s.axioms.toList

#eval collectAxiomsOf ``problem2

