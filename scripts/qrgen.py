import sys
from enum import Enum

import qrcode
from qrcode.constants import (
    ERROR_CORRECT_L,
    ERROR_CORRECT_M,
    ERROR_CORRECT_Q,
    ERROR_CORRECT_H,
)


class ErrorCorrectLevel(Enum):
    LOW = ERROR_CORRECT_L
    MEDIUM = ERROR_CORRECT_M
    QUARTILE = ERROR_CORRECT_Q
    HIGH = ERROR_CORRECT_H


def get_level_from_string(level_str: str) -> ErrorCorrectLevel:
    level_str = level_str.lower()
    match (level_str):
        case "low":
            return ErrorCorrectLevel.LOW.value
        case "medium":
            return ErrorCorrectLevel.MEDIUM.value
        case "quartile":
            return ErrorCorrectLevel.QUARTILE.value
        case "high":
            return ErrorCorrectLevel.HIGH.value
        case _:
            raise ValueError(f"Invalid level: {level_str}")


def generate_qr_code(
    data: str,
    version: int = 4,
    level: ErrorCorrectLevel = ErrorCorrectLevel.MEDIUM.value,
) -> None:
    qr = qrcode.QRCode(
        version=version,
        error_correction=level,
        box_size=1,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")
    img_pixel = img.get_image().load()

    width, height = img.size
    for y in range(height):
        line = ""
        for x in range(width):
            line += "██" if img_pixel[x, y] == 0 else "  "
        print(line)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: qrgen.py <text> [version] [level]")
        sys.exit(1)

    text = sys.argv[1]
    version = int(sys.argv[2]) if len(sys.argv) > 2 else 4
    level = sys.argv[3] if len(sys.argv) > 3 else "medium"

    generate_qr_code(text, version=version, level=get_level_from_string(level))
