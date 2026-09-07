#!/bin/bash
set -euo pipefail

SOURCE_DIR=Adwaita-teal
TARGET_DIR=Adwaita-maia

# Ensure hex color has leading #
validate_hex_color() {
    local color="$1"
    if [[ "$color" =~ ^#?[0-9A-Fa-f]{6}$ ]]; then
        [[ "$color" =~ ^# ]] || color="#$color"
        echo "$color"
        return 0
    fi
    return 1
}

# Generate a darker color by applying ratio logic
generate_darker_color() {
    local light_color="${1#\#}"
    local dark_color="${2#\#}"

    # Convert hex to decimal
    local r_light=$((16#${light_color:0:2}))
    local g_light=$((16#${light_color:2:2}))
    local b_light=$((16#${light_color:4:2}))

    local r_dark=$((16#${dark_color:0:2}))
    local g_dark=$((16#${dark_color:2:2}))
    local b_dark=$((16#${dark_color:4:2}))

    # If any light component is zero, avoid division by zero by using a small value
    [ "$r_light" -eq 0 ] && r_light=1
    [ "$g_light" -eq 0 ] && g_light=1
    [ "$b_light" -eq 0 ] && b_light=1

    # Compute ratios and apply them
    local r_ratio g_ratio b_ratio
    r_ratio=$(awk "BEGIN{printf \"%.6f\", $r_dark / $r_light}")
    g_ratio=$(awk "BEGIN{printf \"%.6f\", $g_dark / $g_light}")
    b_ratio=$(awk "BEGIN{printf \"%.6f\", $b_dark / $b_light}")

    local r_darker g_darker b_darker
    r_darker=$(awk "BEGIN{printf \"%d\", ($r_dark * $r_ratio)}")
    g_darker=$(awk "BEGIN{printf \"%d\", ($g_dark * $g_ratio)}")
    b_darker=$(awk "BEGIN{printf \"%d\", ($b_dark * $b_ratio)}")

    # Clamp
    (( r_darker = (r_darker < 0 ? 0 : (r_darker > 255 ? 255 : r_darker)) ))
    (( g_darker = (g_darker < 0 ? 0 : (g_darker > 255 ? 255 : g_darker)) ))
    (( b_darker = (b_darker < 0 ? 0 : (b_darker > 255 ? 255 : b_darker)) ))

    printf "#%02x%02x%02x\n" "$r_darker" "$g_darker" "$b_darker"
}

create_adwaita_custom() {
    local NEW_LIGHT_COLOR NEW_DARK_COLOR DARKER_COLOR
    NEW_LIGHT_COLOR="#b9e2da"
    NEW_DARK_COLOR="#16a085"

    # Validate (keeps format consistent)
    NEW_LIGHT_COLOR=$(validate_hex_color "$NEW_LIGHT_COLOR") || return 1
    NEW_DARK_COLOR=$(validate_hex_color "$NEW_DARK_COLOR")   || return 1

    # Compute derived darker color
    DARKER_COLOR=$(generate_darker_color "$NEW_LIGHT_COLOR" "$NEW_DARK_COLOR")

    # Remove existing target if present (clean start)
    if [ -d "$TARGET_DIR" ]; then
        rm -rf "$TARGET_DIR"
    fi

    # Copy theme
    cp -r "$SOURCE_DIR" "$TARGET_DIR"

    # Update index.theme: Name and Inherits
    local INDEX_FILE="$TARGET_DIR/index.theme"
    if [ -f "$INDEX_FILE" ]; then
        sed -i 's/^Name=.*$/Name=Adwaita-maia/' "$INDEX_FILE"
        # Replace or add an Inherits line with desired set
        if grep -qi '^Inherits=' "$INDEX_FILE"; then
            sed -i 's/^Inherits=.*$/Inherits=MoreWaita,Adwaita,AdwaitaLegacy,hicolor/' "$INDEX_FILE"
        else
            printf '\nInherits=MoreWaita,Adwaita,AdwaitaLegacy,hicolor\n' >> "$INDEX_FILE"
        fi
    fi

    # Process SVG files in scalable directory (if present)
    local scalable_dir="$TARGET_DIR/scalable"
    if [ -d "$scalable_dir" ]; then
        # Use find -print0 to safely handle filenames
        while IFS= read -r -d '' file; do
            # replace a set of color tokens with chosen colors
            sed -i "s/#129eb0/${NEW_DARK_COLOR}/gi" "$file" || true
            sed -i "s/#2190a4/${NEW_DARK_COLOR}/gi" "$file" || true
            sed -i "s/#108094/${NEW_DARK_COLOR}/gi" "$file" || true
            sed -i "s/#1d8094/${NEW_DARK_COLOR}/gi" "$file" || true
            sed -i "s/#40c1d9/${NEW_DARK_COLOR}/gi" "$file" || true

            sed -i "s/#007184/${DARKER_COLOR}/gi" "$file" || true

            sed -i "s/#9edae6/${NEW_LIGHT_COLOR}/gi" "$file" || true
            sed -i "s/#7bdff4/${NEW_LIGHT_COLOR}/gi" "$file" || true
            sed -i "s/#3da7bc/${NEW_LIGHT_COLOR}/gi" "$file" || true
        done < <(find "$scalable_dir" -type f -name '*.svg' -print0)
    fi

    # Special handling for Nautilus icon (if exists)
    local NAUTILUS_FILE="$TARGET_DIR/scalable/apps/org.gnome.Nautilus.svg"
    if [ -f "$NAUTILUS_FILE" ]; then
        sed -i "s/#08382e/${DARKER_COLOR}/gi" "$NAUTILUS_FILE" || true
        sed -i "s/#0f6c59/${NEW_DARK_COLOR}/gi" "$NAUTILUS_FILE" || true
        sed -i "s/#1c7a8c/${DARKER_COLOR}/gi" "$NAUTILUS_FILE" || true
        sed -i "s/fill-opacity:0\.69749063/fill-opacity:0.5/gi" "$NAUTILUS_FILE" || true
        sed -i "s/fill:#1c7a8c/fill:${DARKER_COLOR}/gi" "$NAUTILUS_FILE" || true
    fi

    return 0
}

# Execute
create_adwaita_custom

exit 0
