```vhdl
ENTITY counter IS
  PORT (clk : IN  STD_LOGIC;
       rst : IN  STD_LOGIC;
       count : OUT INTEGER);
END ENTITY;

ARCHITECTURE behavioral OF counter IS
  SIGNAL internal_count : INTEGER := 0;
BEGIN
  PROCESS (clk, rst)
  BEGIN
    IF rst = '1' THEN
      internal_count <= 0;
    ELSIF rising_edge(clk) THEN
      internal_count <= internal_count + 1;
    END IF;
  END PROCESS;
  count <= internal_count;
END ARCHITECTURE;
```