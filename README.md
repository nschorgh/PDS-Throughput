High-Throughput PDS Data Processing
===================================

*by Norbert Schorghofer*

Throughput benchmarks for various lossless compression formats applied to a data set from the PDS (Planetary Data System)


Input files for case study:  
* Diviner RDR level-1 files  

Benchmarked compression formats:
* zip, gzip, lzma, lz4, br, zstd, and others  

`report.pdf` Report that describes the results  

`prepfiles.cmd`  creates files of various compression formats using default level  
`prepfiles_other.cmd`  creates files of various compression formats using non-default levels  

`timecompress.cmd`  measures times for file compression  
`compress1-benchmark.pdf` plot of compression ratio versus compression time  

`timedecompress1.cmd`  measures times for file decompression  
`timedecompress1_stdout.cmd`  measures times for file decompression via stdout  
`decompress1-benchmark.pdf` plot of compression ratio versus decompression time (main result)  

`Parallel/timeparallelfilter.cmd`  measures times for parallel file decompression and filtering  
`Parallel/timefilter1.cmd`  measures times for individual calls of `filter1_*.cmd`  
`Parallel/filter1_*.cmd`  shell scripts called by `./time*.cmd`  
`Parallel/parallel-filter-times-*.pdf`  plots showing results for scaling with number of threads  

---

### Acknowledgments

This study was supported by NASA's Lunar Data Analysis Program.

