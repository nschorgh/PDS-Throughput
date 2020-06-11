Utilities for High-Throughput PDS Data Processing
=================================================

*by Norbert Schorghofer*


These are the first components of a collection of utitilies for high-throughput processing of data from the PDS (Planetary Data System).

Formats:  
* Diviner RDR level-1 files




### Throughput Studies

`prepfiles.cmd`  creates files of various compression formats using default level  
`prepfiles_other.cmd`  creates files of various compression formats using non-default levels  

`timedecompress1.cmd`  measures times for file decompression  
`timedecompress1_stdout.cmd`  measures times for file decompression via stdout  
`timecompress.cmd`  measures times for file compression  

`Parallel/timeparallelfilter.cmd`  measures times for parallel file decompresson and filtering  
`Parallel/timefilter1.cmd`  measures times for individual calls of `filter1_*.cmd`  
`Parallel/filter1_*.cmd`  shell scripts called by `./time*.cmd`  


### Throughput Tools

To be developed.


---

### Acknowledgments

This study is supported by NASA's Lunar Data Analysis Program.

