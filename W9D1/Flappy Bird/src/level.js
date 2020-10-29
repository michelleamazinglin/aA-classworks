const PIPECONSTS = {
    PIPEWIDTH: 60,
    PIPEGAP: 150,
    PIPEDIST: 220,
    PIPESPEED: 1,
    YMIN: 40, 
    YMAX: 310
}

export default class Level {
    constructor(dimensions) {
        this.dimensions = dimensions;
        this.pipes = [
            this.randPipe(60), 
            this.randPipe(340), 
            this.randPipe(620)
        ];
    }

    randPipe(x) {
        let gapTop = Math.floor((Math.random() * PIPECONSTS.YMAX)) + PIPECONSTS.YMIN;
        pipe = {
            topPipe: {
                left: x,
                top: 0,
                right: x + PIPECONSTS.PIPEWIDTH,
                bot: gapTop
            },
            botPipe: {
                left: x,
                top: gapTop + PIPECONSTS.PIPEGAP,
                right: x + PIPECONSTS.PIPEWIDTH,
                bot: 640
            }
        }
        return pipe;
    }

    // movePipes() {
    //     this.pipes.forEach(pipe => {
    //         pipe.topPipe.left -= PIPECONSTS.PIPESPEED;
    //         pipe.topPipe.right -= PIPECONSTS.PIPESPEED;
    //         pipe.botPipe.left -= PIPECONSTS.PIPESPEED;
    //         pipe.botPipe.right -= PIPECONSTS.PIPESPEED;
    //     })
    // }

    drawBackground(ctx) {
        ctx.fillStyle = "skyblue";
        ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
    }

    drawPipes(ctx) {
        this.pipes.forEach(pipe => {
            ctx.fillStyle = 'lightgreen';
            ctx.fillRect(pipe.topPipe.left, pipe.topPipe.top, (pipe.topPipe.right - pipe.topPipe.left), (pipe.topPipe.bot - pipe.topPipe.top))
            ctx.fillRect(pipe.botPipe.left, pipe.botPipe.top, (pipe.botPipe.right - pipe.botPipe.left), (pipe.topPipe.bot - pipe.topPipe.top))
        })
    }

    animate(ctx) {
        this.drawBackground(ctx);
        // this.movePipes();
        this.drawPipes(ctx);
    }
}