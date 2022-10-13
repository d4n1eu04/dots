const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1c1c1c", /* black   */
  [1] = "#6b55eb", /* red     */
  [2] = "#eb55eb", /* green   */
  [3] = "#7861ec", /* yellow  */
  [4] = "#ec636b", /* blue    */
  [5] = "#ed696b", /* magenta */
  [6] = "#f1938f", /* cyan    */
  [7] = "#e2cbc6", /* white   */

  /* 8 bright colors */
  [8]  = "#9e8e8a",  /* black   */
  [9]  = "#6b55eb",  /* red     */
  [10] = "#eb55eb", /* green   */
  [11] = "#7861ec", /* yellow  */
  [12] = "#ec636b", /* blue    */
  [13] = "#ed696b", /* magenta */
  [14] = "#f1938f", /* cyan    */
  [15] = "#e2cbc6", /* white   */

  /* special colors */
  [256] = "#1c1c1c", /* background */
  [257] = "#e2cbc6", /* foreground */
  [258] = "#e2cbc6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
