# Сохрани скрипт
cat > ~/.dotfiles/stow_setup.sh << 'EOF'
#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"
cd "$DOTFILES_DIR" || exit

PACKAGES=(
    fonts
    nvim
    wezterm
)

echo "=== Удаляем старые симлинки ==="
for pkg in "${PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "  Удаляем: $pkg"
        stow -D "$pkg" 2>/dev/null || echo "    (не было симлинков)"
    fi
done

echo "=== Создаём новые симлинки ==="
for pkg in "${PACKAGES[@]}"; do
    if [ -d "$pkg" ]; then
        echo "  Создаём: $pkg"
        stow -v "$pkg"
    else
        echo "  Пакет не найден: $pkg"
    fi
done

echo "=== Готово! ==="
EOF

# Сделай исполняемым
chmod +x ~/.dotfiles/stow_setup.sh

# Выполни
~/.dotfiles/stow_setup.sh
