package com.comk.project.first.utils;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;
/**
 * Created by daihai on 2015/2/16.
 */
public class ImageUtils {
        private static ImageUtils instance;

    public static ImageUtils getInstance() {
        if(instance == null)
            instance = new ImageUtils();
        return instance;
    }

    public String getCheckCodeImage(String str, int show, ByteArrayOutputStream output) {
        Random random = new Random();
        BufferedImage image = new BufferedImage(80, 30, BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Arial", Font.PLAIN, 24);
        int distance = 18;
        Graphics d = image.getGraphics();
        d.setColor(Color.WHITE);
        d.fillRect(0, 0, image.getWidth(), image.getHeight());
        d.setColor(new Color(random.nextInt(100) + 100, random.nextInt(100) + 100, random.nextInt(100) + 100));
        for (int i = 0; i < 10; i++) {
            d.drawLine(random.nextInt(image.getWidth()), random.nextInt(image.getHeight()), random.nextInt(image.getWidth()),
                    random.nextInt(image.getHeight()));
        }
        d.setColor(Color.BLACK);
        d.setFont(font);
        String checkCode = "";
        char tmp;
        int x = -distance;
        for (int i = 0; i < show; i++) {
            tmp = str.charAt(random.nextInt(str.length() - 1));
            checkCode = checkCode + tmp;
            x = x + distance;
            d.setColor(new Color(random.nextInt(100) + 50, random.nextInt(100) + 50, random.nextInt(100) + 50));
            d.drawString(tmp + "", x, random.nextInt(image.getHeight() - (font.getSize())) + (font.getSize()));
        }
        d.dispose();
        try {
            ImageIO.write(image, "jpg", output);
        } catch (IOException e) {
            // log.warn("生成验证码错误.", e);
        }
        return checkCode;
    }
}
