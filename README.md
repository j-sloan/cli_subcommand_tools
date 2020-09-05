CLI subcommand tools
====================

A small set of utilities for making subcommand-based CLI interfaces.

The main entry point in `__main__.py` should resemble:

```
from typing import Dict
from cli_subcommand_tools.tools import AsyncTool, main

# instantiate each tool here, with the cli tool name as the key
TOOLS: Dict[str, AsyncTool] = {}

if __name__ == "__main__":
    main(TOOLS)
```

Tools should be defined as sub-classes of `cli_subcommand_tools.tools.AsyncTool`.
The (async) callable returned by `make_tool` will have keyword-only arguments populated from the CLI options.
