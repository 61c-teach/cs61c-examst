#import "/lib.typ": *

#show: exam.with(
  semester: "Fall 2024",
  instructors: ("Garcia", "Kao"),
  exam: "Final",
  time: "170 minutes",
  print-answers: false,
)

#include "questions/01-Potpourri.typ"
#pagebreak()

#include "questions/02-RISCV.typ"
#pagebreak()

#include "questions/03-Mystery-Mix.typ"
#pagebreak()

#include "questions/04-Single_Cycle_DP.typ"
#pagebreak()

#include "questions/05-Hazards.typ"
#pagebreak()

#include "questions/06-SDS.typ"
#pagebreak()

#include "questions/07-Caches.typ"
#pagebreak()

#include "questions/08-DLP.typ"
#pagebreak()

#include "questions/09-VM.typ"
#pagebreak()

#include "questions/10-FSM.typ"
#pagebreak()

#include "questions/11-doodle.typ"
// No pagebreak at the end
