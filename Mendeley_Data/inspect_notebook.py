import json

notebook_file = 'No_Defects.ipynb'

try:
    with open(notebook_file, 'r', encoding='utf-8') as f:
        nb = json.load(f)
    
    print('='*80)
    print('JUPYTER NOTEBOOK: No_Defects.ipynb')
    print('='*80)
    print()
    
    # Basic notebook info
    print(f'Notebook Format Version: {nb.get(\
nbformat\, \N/A\)}.{nb.get(\nbformat_minor\, \N/A\)}')
    print()
    
    # Kernelspec
    kernelspec = nb.get('metadata', {}).get('kernelspec', {})
    if kernelspec:
        print(f'Kernel: {kernelspec.get(\display_name\, \N/A\)} ({kernelspec.get(\name\, \N/A\)})')
    print()
    
    # Cell count and types
    cells = nb.get('cells', [])
    print(f'Total Cells: {len(cells)}')
    print()
    
    # Analyze cells
    cell_types = {}
    for idx, cell in enumerate(cells):
        cell_type = cell.get('cell_type', 'unknown')
        cell_types[cell_type] = cell_types.get(cell_type, 0) + 1
        
        print(f'Cell {idx + 1}: {cell_type.upper()}')
        if cell_type == 'code':
            source = cell.get('source', [])
            if isinstance(source, list):
                source_text = ''.join(source)
            else:
                source_text = source
            print(f'  Lines of code: {len(source_text.splitlines())}')
            if len(source_text) > 200:
                print(f'  First 200 chars: {source_text[:200]}...')
            else:
                print(f'  Content: {source_text}')
        elif cell_type == 'markdown':
            source = cell.get('source', [])
            if isinstance(source, list):
                source_text = ''.join(source)
            else:
                source_text = source
            print(f'  Markdown length: {len(source_text)} chars')
            if len(source_text) > 150:
                print(f'  First 150 chars: {source_text[:150]}...')
            else:
                print(f'  Content: {source_text}')
        print()
    
    print(f'Cell Type Summary: {cell_types}')

except Exception as e:
    print(f'Error reading notebook: {e}')

