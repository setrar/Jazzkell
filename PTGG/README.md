# PTGG (Probabilistic Temporal Graph Grammar) design pattern

Yes, that `SimpleBossa.lhs` file **absolutely follows the PTGG (Probabilistic Temporal Graph Grammar) design pattern**, but it represents a highly specialized, practical evolution of the theory.

This specific repository is a fork of **Jazzkell**, a generative music framework designed by Dr. Donya Quick (who co-authored much of the seminal research on Kulitta and structural grammar systems in Haskell alongside Paul Hudak).

The file bridges the gap between the purely abstract "tree-rewriting" grammar we built and a functional, domain-specific music application.

### Where it matches the PTGG theory perfectly

1. **The State Monad Context:** Just like our custom `Prog` monad (or our simplified `State StdGen` alias), Jazzkell relies on a monadic context to thread random numbers invisibly background-to-background as rules are executed.
2. **Context-Free/Stochastic Rewriting:** The core generation loop takes abstract symbols (like Roman numerals or broad functional chord blocks), rolls against a probability table, and splits them down into finer time segments (e.g., expanding a 4-beat container into specialized syncopated rhythmic nodes).
3. **Temporal Tracking:** Time and duration are baked straight into the evaluation rules. Structural symbols are functions that take an inherited duration (`Dur -> Term` or `Dur -> Music`) and distribute that exact time allocation among their newly spawned child branches.

### The Evolution: Why it looks slightly different

While our example compiled abstract AST data types (`NT`, `S`, `Mod`) into hardcoded byte data, `SimpleBossa.lhs` adapts the grammar concept directly to the standard **Euterpea** syntax:

* **Direct Musical Output:** Instead of producing a generic `Term` tree that needs to be manually flattened and compiled later, its rewriting functions directly yield Euterpea `Music Pitch` or `Music (Pitch, Loudness)` primitives.
* **Layering vs. Parallel S:** Instead of a generic parallel constructor `S [Term]`, Jazzkell uses Euterpea's native operator `(:=:)` to overlay entirely separate algorithmic structures (such as a Bossa Nova piano comping pattern playing simultaneously over an independent syncopated bassline) while forcing them to share a common, synchronized chord-progression context.

The `SimpleBossa.lhs` file demonstrates exactly how the strict algebraic graph grammar logic from the research paper is deployed in production to generate stylized, groove-oriented music.

A brief visual introduction to how these generative structures operate can be observed in this video demonstrating [Jazzkell in action](https://www.youtube.com/watch?v=pvTz_mIrWT0), which demonstrates how real-time environments adaptively guide the underlying stochastic frameworks.

---

In Donya Quick's **PTGG (Probabilistic Temporal Graph Grammar)** theory—formulated in her Yale dissertation and implemented in her composition framework *Kulitta*—music is composed through **hierarchical abstraction** and **separation of concerns**.

Instead of generating raw MIDI notes all at once, a PTGG breaks composition into two distinct stages:

1. **The Structural/Temporal Stage (The Skeleton):** Generating a timeline of abstract harmonic events and metrical durations.
2. **The Realization Stage (The Performers):** Fleshing out those abstract structures into concrete pitch voicings, rhythms, and improvisations.

The `JazzTypes.hs` code implements the **Realization Engine** of PTGG for jazz ensemble performance.

---

### Key Theoretical Mappings

#### 1. Abstraction of Pitch & Harmony

> **PTGG Concept:** Abstract symbols (like scale degrees or chord symbols) are separated from concrete voicings to prevent combinatoric explosion and enforce pitch-class symmetry.

```haskell
type PCNum = Int
type Scale = [PCNum]
data ChordCtxt = ChordCtxt { sym :: String, scale :: Scale }

```

In traditional music theory, "C7" and "B♯7" are enharmonically equivalent but distinct. `JazzTypes` avoids string/symbol redundancy by reducing pitch spaces to **Pitch Class Numbers ($\mathbb{Z}_{12}$ integers $0..11$)**. A `ChordCtxt` acts as the temporal "environment"—it tells players what set of scale degrees are valid for improvisation without hardcoding actual frequencies or note octaves.

---

#### 2. Temporal Partitioning & Metric Scaffolding

> **PTGG Concept:** Temporal grammars parameterize production rules by *duration* (`Beat`) and *metrical position* (`Onset`).

```haskell
data SegStyle a = Free | FixedPitch [AbsPitch] | FixedMusic (Music a)
data Segment a = Segment {
    chordCtxt :: ChordCtxt,
    category  :: SegCat,
    styles    :: [(PartType, SegStyle a)],
    segOnset  :: Onset,
    segDur    :: Beat,
    timeSig   :: TimeSig }

type LeadSheet a = [Segment a]

```

A **LeadSheet** represents the terminal output of a PTGG expansion: a sequential list of `Segment`s.

* Each segment carries its duration (`segDur`), onset time (`segOnset`), and meter (`timeSig`).
* `styles` allows the grammar to dictate whether a performer should improvise freely (`Free`), follow fixed guide-tone pitches (`FixedPitch`), or play written themes/riffs (`FixedMusic`).

---

#### 3. Agent-Based Realization & Polymorphic State

> **PTGG Concept:** Converting abstract chord progressions into concrete polyphony requires stateful agents that traverse constraints across time.

```haskell
type History a = [(PartType, Music a)]
type PartFun a s = s -> Segment a -> Maybe (Segment a) -> History a -> StdGen -> (StdGen, s, Music a)

```

`PartFun` is the computational heart of the realization engine. It is a state-transition function for a single performer:

* **Current Context (`Segment a`):** What chord/scale are we playing over right now?
* **Lookahead (`Maybe (Segment a)`):** What is the *next* chord? (Crucial for voice leading, walking bass target roots, and chromatic turnarounds).
* **Inter-Agent Communication (`History a`):** What did the other band members play in the previous segment? (Enables call-and-response or accompaniment adjustment).
* **Polymorphic State (`s`):** Allows any performance agent to track memory (e.g., last pitch played, current motif, walking bass state) across segment boundaries without fixing the state type globally.
* **Randomness (`StdGen`):** Pure functional handling of stochastic generation.

---

#### 4. Ensemble Composition & Concurrent Execution

> **PTGG Concept:** Parallel execution (polyphony) is realized by running independent generative processes in parallel over shared temporal bounds.

```haskell
data JazzPart a s = JazzPart {
    partType :: PartType,
    instr    :: InstrumentName,
    partFun  :: PartFun a s,
    state    :: s }

type JazzBand a s = [JazzPart a s]

```

A `JazzBand` groups independent performer agents together. When evaluated over a segment, every `JazzPart` runs its `partFun` over the *same* `Segment` parameters, producing parallel `Music a` streams.

---

#### 5. Dynamic Execution Loop (`runBand`)

> **PTGG Concept:** Sequential composition via monadic/recursive state folding.

```haskell
runBand :: JazzBand a s -> History a -> LeadSheet a -> StdGen -> Music a
runBand jb h (seg1:segs) g =
    let seg2 = if null segs then Nothing else Just (head segs)
        result = runSegment jb h seg1 seg2 g
        (gs, states, ms) = unzip3 result
        jb' = zipWith (\st jp -> jp{state=st}) states jb
        h' = zip (map partType jb) ms
    in  foldr1 (:=:) ms :+: runBand jb' h' segs (last gs)

```

The `runBand` function steps through the `LeadSheet` chunk by chunk:

1. **Parallel Evaluation (`foldr1 (:=:) ms`):** Evaluates all band members concurrently for `seg1`, combining their music into a single parallel block using Euterpea's `:=:` operator.
2. **State & History Propagation:**
* `jb'`: Updates each musician's state (`st`) for the next iteration.
* `h'`: Packs the current segment's musical output into `History` so band members can inspect what others played in subsequent steps.


3. **Sequential Concatenation (`:+:`):** Chains the current parallel segment to the rest of the generated song using Euterpea's `:+:` operator.
