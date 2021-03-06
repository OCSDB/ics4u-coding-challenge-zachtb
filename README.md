# CodingChallenge: Julia Set
Blake, Thomas, Zach

### Presentation Plan
| Time           | Content                 |
| -------------  | -------------           |
| 10:38 - 10:48  | Explanation of Julia set|
| 10:48 - 10:58  | Concepts and aplications|
| 10:58 - 11:28  | Live Coding             |
| 11:28 - 11:38  | Questions               |
| 11:38 - 11:53  | Experimenting with code |

### Julia Set
The Julia set is basically a piece of the Mandelbrot set. Instead of continuously generating a ‘C’ value, we use a constant. The constant has a Real component, and a Complex component. The X-Axis represents ‘A’, and the Y-axis represents ‘B’. For example, for a specific Julia Set, we have 2 parts to the constant. The ‘C’ value then becomes part of this recursive formula: 
* Z0=0
* Z1=Z02+C
* Z2=Z12+C
* Z3=Z22+C
* Z4=Z32+C

### Sets
A set in math is a collection of objects (ex. People, letters, numbers, etc...) where order and repetition do not matter. The Julia set is a set of point/coordinates on the complex plane within a certain range.

### Pixels
In its broadest terms, a pixel is a mappable position, for example, on a screen. To map this position, we use computer science. So, relating this idea back to the Mandelbrot Set and the Julia Sets, we can see that a pixel is made up from the ‘A’ and the ‘B’ values of the ‘C’ value. Remember that the complex plane is this: 
The X-Axis is the real number component and the Y-Axis is Imaginary component. Plotting this Complex Number reveals a pixel of the Julia Set.
The understanding of a pixel in the Julia Set and the Mandelbrot set can be applied to displays. A physical pixel in a display is mapped by a point in columns and rows. By looking at what is stored in a particular point in the set of pixels reveals the RGB information. 

### Emerging Technology
* Currently used to visualize the complex plane
* [Generating more cat pictures](https://blogs.scientificamerican.com/observations/fractal-kitties-illustrate-the-endless-possibilities-for-julia-sets/) if the internet ever runs out (using the julia set to approximate an objects outline)
* [Digital signature scheme](https://pdfs.semanticscholar.org/8cd5/e8365d55180a236a6dd6a5a212dddae318bd.pdf) based on Mandelbrot and Julia fractal sets (Proposed but not yet actualized)

### Slides
Link: https://docs.google.com/presentation/d/1TIOs75pAizXbu-f9Wf1tV-9NqN0lP0pTOCaB9En4vdI/edit#slide=id.g4c86c872bf_1_
