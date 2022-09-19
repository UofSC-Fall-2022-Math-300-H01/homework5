import Hw4
import Lean.Meta
import Lean.Elab.Print
import Lean.Elab.Command
import Lean.Elab.Frontend

open Lean
open Lean.Elab
open Lean.Meta
open Lean.Elab.Command

def collectAxiomsOf (constName : Name) : MetaM (List String) := do
  let env ← getEnv
  let (_, s) := ((CollectAxioms.collect constName).run env).run {}
  let a := s.axioms.toList.map toString
  return a

#eval Name.mkSimple "hi"

def myState (env : Environment) : Core.State := 
  ⟨env,default,default,default,default,default,default⟩ 
def myContext (fileName : String) : Core.Context := 
  ⟨fileName,default,default,default,default,default,default,default,default,default,default⟩

#check runFrontend

#eval collectAxiomsOf ``problem2

#check MetaM.toIO (collectAxiomsOf ``problem2)

#check myContext "Hw4.lean" 

#check runFrontend 

def main : IO Unit := do
  let input ← IO.FS.readFile "Hw4.lean"
  let env ← Prod.fst <$> runFrontend input {} "" default 
  -- IO.println s!"{env.allImportedModuleNames}"
  let (list,_,_) ← MetaM.toIO (collectAxiomsOf (Name.mkSimple "problem2")) (myContext "Hw4.lean") (myState env) 
  IO.println s!"{list}"

#eval main 
