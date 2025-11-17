#!/bin/bash
scripts=(
"0-current_working_directory"
"1-listit"
"2-bring_me_home"
"3-listfiles"
"4-listmorefiles"
"5-listfilesdigitonly"
"6-firstdirectory"
"7-movethatfile"
"8-firstdelete"
"9-firstdirdeletion"
"10-back"
"11-lists"
"12-file_type"
"13-symbolic_link"
"14-copy_html_files"
)

echo "Verificando scripts del 0 al 15..."

for s in "${scripts[@]}"; do
    file_path="basics/$s"
    echo "-----------------------------------"
    echo "Script: $file_path"

    if [ -f "$file_path" ]; then
        echo "✅ Existe"
    else
        echo "❌ NO Existe"
        continue
    fi

    first_line=$(head -n 1 "$file_path")
    if [ "$first_line" = "#!/bin/bash" ]; then
        echo "✅ Shebang correcto"
    else
        echo "❌ Shebang incorrecto (Primera línea: '$first_line')"
    fi

    lines=$(wc -l < "$file_path")
    if [ "$lines" -eq 2 ]; then
        echo "✅ Tiene 2 líneas"
    else
        echo "❌ Número de líneas incorrecto ($lines)"
    fi

    if [ -x "$file_path" ]; then
        echo "✅ Permisos de ejecución"
    else
        echo "❌ No tiene permisos de ejecución"
    fi
done
