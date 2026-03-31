# High-End Editorial: Health & Wellness Design System

## 1. Overview & Creative North Star: "The Digital Sanctuary"
This design system moves beyond the utility of a standard fitness tracker to create a "Digital Sanctuary." The aesthetic is rooted in **Soft Minimalism**—a philosophy that prioritizes cognitive ease through expansive negative space, intentional asymmetry, and a tactile sense of depth.

To break the "template" look, we reject the rigid grid in favor of an editorial layout. Key screens should feature oversized, off-center display type paired with generous `spacing-16` or `spacing-20` top margins. By overlapping high-resolution organic imagery with semi-transparent `surface` containers, we create a layered, high-fashion fitness experience that feels curated rather than automated.

## 2. Colors & Surface Architecture
The palette is a sophisticated interplay of clinical purity and organic vitality. We use color not as a decoration, but as a functional tool for orientation.

### The "No-Line" Rule
**Strict Mandate:** Traditional 1px solid borders are prohibited for sectioning. Boundaries must be defined solely through background color shifts. To separate a workout module from the main feed, place a `surface_container_low` card on a `surface` background. 

### Surface Hierarchy & Nesting
Treat the UI as a physical stack of premium materials.
- **Base Layer:** `surface` (#F9F9FE) for the primary application background.
- **Sectioning:** Use `surface_container` (#EDEDF2) for large structural blocks.
- **Interactive Elements:** Use `surface_container_lowest` (#FFFFFF) for cards to create a "lifted" appearance against the slightly darker base.
- **Nesting:** An inner progress stat should sit on `surface_container_high` within a `surface_container_low` parent.

### The "Glass & Gradient" Rule
For floating navigation bars or action sheets, use **Glassmorphism**. Apply a `surface` color at 80% opacity with a 20px backdrop blur. For primary action buttons, move beyond flat fills; use a subtle linear gradient from `primary` (#006E28) to `primary_container` (#34C759) at a 135° angle to give the element "soul" and weight.

## 3. Typography: The Editorial Voice
We utilize a dual-font strategy to balance authority with readability.

| Level | Token | Font | Size | Usage |
| :--- | :--- | :--- | :--- | :--- |
| **Display** | `display-lg` | Manrope (Bold) | 3.5rem | Daily step counts, "Hero" motivational headers. |
| **Headline**| `headline-md` | Manrope (Semibold)| 1.75rem | Section titles, Workout names. |
| **Title**   | `title-lg` | Inter (Medium) | 1.375rem | Card headers, Modal titles. |
| **Body**    | `body-md` | Inter (Light) | 0.875rem | Instructions, descriptions, secondary data. |
| **Label**   | `label-md` | Inter (Bold/Caps)| 0.75rem | Overlines, small metrics (BPM, KCAL). |

**Identity Note:** High-contrast scales (pairing a `display-lg` metric with a `body-sm` label) create the "premium" editorial feel typical of high-end wellness journals.

## 4. Elevation & Depth: Tonal Layering
Depth in this system is an atmospheric quality, not a structural one.

*   **The Layering Principle:** Use the `Roundedness Scale` of `xl` (3rem) for main containers and `md` (1.5rem) for internal elements. Depth is achieved by "stacking" tones—e.g., a white card on a light grey background creates a natural elevation.
*   **Ambient Shadows:** If a card must "float" (e.g., a persistent "Start Workout" button), use a shadow with a 40px blur and 6% opacity. The shadow color should be a tint of `on_surface` (#1A1C1F), never pure black.
*   **The "Ghost Border" Fallback:** If accessibility requires a stroke, use `outline_variant` at 15% opacity. This provides a "suggestion" of a boundary without breaking the soft aesthetic.

## 5. Components

### Buttons & Chips
*   **Primary Action:** `primary` fill, `on_primary` text. Uses `xl` (3rem) roundedness for a pill-shaped, tactile feel.
*   **Secondary/Selection Chips:** Use `surface_container_highest` with `on_surface` text. When selected, transition to `primary_container` with a subtle 4% shadow.
*   **Forbid Dividers:** Never use lines to separate list items. Use `spacing-4` vertical gaps or alternating `surface_container_low` backgrounds.

### Input Fields & Cards
*   **Input Fields:** Minimalist containers using `surface_container_low`. Labels should be `label-md` placed 8px above the input, never inside as placeholder text.
*   **Health Cards:** Must use `xl` (3rem) corners. Internal padding should never be less than `spacing-6` (2rem) to ensure the content "breathes."

### Specialized Wellness Components
*   **The Progress Ring:** Use `primary` for the active state and `surface_container_highest` for the track. The stroke should be rounded.
*   **Floating Metric Bar:** A glassmorphic `surface` bar at the bottom of the screen to track active calories during a workout, utilizing `backdrop-blur`.

## 6. Do's and Don'ts

### Do
*   **DO** use whitespace as a functional element. If a screen feels "busy," increase the padding between sections using `spacing-12`.
*   **DO** use `tertiary` (#9C413D) sparingly for high-alert data (e.g., heart rate spikes) to maintain the calming green/white balance.
*   **DO** lean into asymmetry. Place a large `display-lg` metric on the left and a small `label-sm` descriptive block on the right.

### Don't
*   **DON'T** use 100% black (#000000). Use `on_surface` (#1A1C1F) for all "black" text to maintain a softer, premium contrast.
*   **DON'T** use sharp corners. Every interactive element must have at least a `sm` (0.5rem) radius to fit the "Sanctuary" vibe.
*   **DON'T** use standard system "Blue" for links. Use `primary` or `on_surface` with an underline to stay within the brand palette.